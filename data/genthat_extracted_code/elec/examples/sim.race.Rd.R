library(elec)


### Name: sim.race
### Title: Simulate CAST audits to assess performance
### Aliases: sim.race

### ** Examples

     ## See how many times the CAST method fails to catch a wrong
     ##  election in 20 trials.
     replicate( 20, sim.race( beta=0.75, stages=2, truth.maker=make.truth.opt.bad) )

     ## Now see how much work the CAST method does for typical elections.
     replicate( 20, sim.race( beta=0.75, stages=2, truth.maker=make.ok.truth) )



