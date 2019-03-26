library(seacarb)


### Name: bjerrum
### Title: Bjerrum plot
### Aliases: bjerrum
### Keywords: utilities

### ** Examples

## Plot the bjerrum plot for the carbonate system using the default values
bjerrum(K1(),K2(),main="DIC speciation",lwd=2) 
abline(v=-log10(K1()),col="grey")
mtext(side=3,at=-log10(K1()),"pK1")
abline(v=-log10(K2()),col="grey")
mtext(side=3,at=-log10(K2()),"pK2")
legend("left",lty=1:3,lwd=2,legend=c(expression(CO[2]),expression(HCO[3]^"-"),
	expression(CO[3]^"2-")))

## Plot the bjerrum plot for phosphate using the default values
bjerrum(K1p(),K2p(),K3p(),main="phosphate speciation",lwd=2)
legend("left",lty=1:4,lwd=2,legend=c(expression(H[3]~PO[4]),
	expression(H[2]~PO[4]^"-"),
expression(HPO[4]^"2-"),expression(PO[4]^"3-")))

## Plot the bjerrum plot for the carbonate system using the values other 
##	than the default ones, showing the effect of temperature
bjerrum(K1(T=25,S=35),K2(T=25,S=35),conc=1.3,main="effect of temperature" )
bjerrum(K1(T=0,S=35),K2(T=0,S=35),conc=1.3,add=TRUE,col="red")
legend("left",lty=1,col=c("black","red"),legend=c("T=25 oC","T=0 oC"))
legend("right",lty=1:3,legend=c(expression(CO[2]),expression(HCO[3]^"-"),
	expression(CO[3]^"2-")))

## Plot the bjerrum plot for the carbonate system using the values other 
##	than the default ones, showing the effect of salinity
bjerrum(K1(T=25,S=35),K2(T=25,S=35),conc=1.3,main="effect of salinity" )
bjerrum(K1(T=25,S=5),K2(T=25,S=5),conc=1.3,add=TRUE,col="blue")
legend("left",lty=1,col=c("black","blue"),legend=c("S=35","S=5"))
legend("right",lty=1:3,legend=c(expression(CO[2]),expression(HCO[3]^"-"),
	expression(CO[3]^"2-")))

## Plot the bjerrum plot for the carbonate system using the values other 
##	than the default ones, showing the effect of pressure
bjerrum(K1(P=0),K2(P=0),conc=1.3,main="effect of pressure" )
bjerrum(K1(P=300),K2(P=300),conc=1.3,add=TRUE,col="green")
legend("left",lty=1,col=c("black","green"),legend=c("P=0","P=300"),title="atm")
legend("right",lty=1:3,legend=c(expression(CO[2]),expression(HCO[3]^"-"),
	expression(CO[3]^"2-")))



