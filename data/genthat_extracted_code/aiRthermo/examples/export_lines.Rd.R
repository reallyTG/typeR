library(aiRthermo)


### Name: export_lines
### Title: Export the lines for the thermodynamic diagram
### Aliases: export_lines
### Keywords: Functions

### ** Examples

data(RadiosondeA)
aPs<-RadiosondeA[,1]*100
aTs<-C2K(RadiosondeA[,3])
stuveA<-stuve_diagram(Pres = aPs/100,Temp=aTs-273.15)



