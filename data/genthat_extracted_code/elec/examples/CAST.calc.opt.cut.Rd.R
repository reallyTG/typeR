library(elec)


### Name: CAST.calc.opt.cut
### Title: Calculate Optimal CAST plan
### Aliases: CAST.calc.opt.cut

### ** Examples


        ## Find optimial cut for  determining which small precincts that
        ## we would set aside and not audit in Santa Cruz
        data(santa.cruz)
        Z = elec.data( santa.cruz, C.names=c("leopold","danner") )

        CAST.calc.opt.cut( Z, beta=0.75, stages=1, t=5, plot=TRUE )



