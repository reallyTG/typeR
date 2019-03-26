library(ncar)


### Name: Res2Txt
### Title: Convert sNCA output table to text form
### Aliases: Res2Txt
### Keywords: Output Form

### ** Examples

x = Theoph[Theoph$Subject=="1","Time"]
y = Theoph[Theoph$Subject=="1","conc"]
z = sNCA(x, y, dose=320, doseUnit="mg", concUnit="mg/L", timeUnit="h")
Res2Txt(z, x, y)  



