library(elec)


### Name: CAST
### Title: CAST Functions
### Aliases: CAST test.CAST CAST.calc.sample CAST.sample CAST.audit

### ** Examples

        ## Make an example cartoon race (from Stark paper)
	Z = make.cartoon()

        ## What should we do?
	samp.info = CAST.calc.sample( Z )
	samp.info

        ## Draw a sample.
	samp = CAST.sample( Z, samp.info$ns )
        samp

        ## Analyze what a CAST audit of santa cruz would entail
        data(santa.cruz)
        Z = elec.data( santa.cruz, C.names=c("leopold","danner") )
        CAST.calc.sample( Z, beta=0.75, stages=1, t=5, small.cut=60)



