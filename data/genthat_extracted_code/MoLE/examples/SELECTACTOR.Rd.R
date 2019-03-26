library(MoLE)


### Name: SELECTACTOR
### Title: Find actor expression
### Aliases: SELECTACTOR SELECTUNDERGOER SELECTVERB

### ** Examples

FOUND()
situation=SITUATION(1)
situation[situation$target==1,]
SELECTACTOR(1, situation)
SELECTVERB(1, situation)
if(!is.na(situation[situation$target==1,]$U1)){
	SELECTUNDERGOER(1, situation)
}



