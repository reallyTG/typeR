library(FinancialInstrument)


### Name: month_cycle2numeric
### Title: coerce month_cycle to a numeric vector
### Aliases: month_cycle2numeric MC2N

### ** Examples

MC2N("H,M,U,Z") # from single string
MC2N(c("H","M","U","Z")) # from single vector
MC2N("h", "M", "u", "Z") # from multiple strings
MC2N(c("F","G"), "H", c("X","Z")) # from multiple vectors
month_cycle2numeric("Mar,jun,SEP,dEc") 
month_cycle2numeric("Mar", "jun", "SEP", "dEc")
MC2N("March,june,sep,decem")
MC2N("March, june, sep, decem") #spaces between commas are ok
month_cycle2numeric("3,6,9,12")
month_cycle2numeric(seq(3,12,3))



