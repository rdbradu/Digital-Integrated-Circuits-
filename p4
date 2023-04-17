Implementati un numarator pe 8 biti cu urmatoarele caracteristici:

- poate fi resetat sincron prin semnalul reset activ in 1.

- poate numara crescator sau descrescator, in functie de valoarea unui semnal de control count_updown: 0 - crescator, 1 - descrescator

- se va incarca cu o valoare externa value atunci cand load_absolute_value este 1.

- se va incarca cu valoarea curenta a numaratorului + value atunci cand load_relative_value este 1.

- toate cele 3 functionalitati de mai sus au loc doar daca semnalul enable este 1.

Prioritatea semnalelor de comanda in functionarea circuitului (ordinea in care ele vor fi testate) este: enable, load_absolute_value, load_relative_value, count_updown

Interfata numaratorului este:

module counter(

    input clock,

    input reset,

    input load_absolute_value,

    input load_relative_value,

    input [7:0] value,

    input count_updown,

    input enable,

    output reg [7:0] count

    );
    
    module counter(

    input clock,

    input reset,

    input load_absolute_value,

    input load_relative_value,

    input [7:0] value,

    input count_updown,

    input enable,

    output reg [7:0] count

    );
    
always@(posedge clock) begin
    if (reset==1)
        count <= 0;
    else if (enable == 1) begin
            if(load_absolute_value == 1 )
                count <= value;
            else if (load_relative_value == 1)
                count <= count + value;
            else if (count_updown == 0)
                    count <= count + 1;
                else 
                    count <= count - 1;
            end 
end 
endmodule
