library(mtk)


### Name: WWDM.factors
### Title: The input factors of the 'WWDM' model
### Aliases: WWDM.factors
### Keywords: dataset

### ** Examples

# The code used to generate the WWDM.factors is as follows:
	Eb <- make.mtkFactor(name="Eb", distribName="unif", 
		nominal=1.85, distribPara=list(min=0.9, max=2.8), unit="g/MJ")
	Eimax <- make.mtkFactor(name="Eimax", distribName="unif", 
		nominal=0.94, distribPara=list(min=0.9, max=0.99))
	K <- make.mtkFactor(name="K", distribName="unif", 
		nominal=0.7, distribPara=list(min=0.6, max=0.8))
	Lmax <- make.mtkFactor(name="Lmax", distribName="unif", 
		nominal=7.5, distribPara=list(min=3, max=12), unit="m\u00b2/m\u00b2")
	A <- make.mtkFactor(name="A", distribName="unif", 
		nominal=0.0065, distribPara=list(min=0.0035, max=0.01))
	B <- make.mtkFactor(name="B", distribName="unif", 
		nominal=0.00205, distribPara=list(min=0.0011, max=0.0025))
	TI <- make.mtkFactor(name="TI", distribName="unif", 
		nominal=900, distribPara=list(min=700, max=1100),unit="\u00b0C")

	WWDM.factors <- mtkExpFactors(list(Eb,Eimax,K,Lmax,A,B,TI))

# To import the WWDM.factors, just use the following line
	data(WWDM.factors)



