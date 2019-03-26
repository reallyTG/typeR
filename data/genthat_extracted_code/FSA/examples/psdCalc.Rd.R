library(FSA)


### Name: psdCalc
### Title: Convenience function for calculating PSD-X and PSD X-Y values.
### Aliases: psdCalc
### Keywords: hplot

### ** Examples

## Random length data
# suppose this is yellow perch to the nearest mm
yepdf <- data.frame(yepmm=round(c(rnorm(100,mean=125,sd=15),rnorm(50,mean=200,sd=25),
                    rnorm(20,mean=300,sd=40)),0),
                    species=rep("Yellow Perch",170))
psdCalc(~yepmm,data=yepdf,species="Yellow perch",digits=1)
psdCalc(~yepmm,data=yepdf,species="Yellow perch",digits=1,drop0Est=TRUE)

## add a length
psdCalc(~yepmm,data=yepdf,species="Yellow perch",addLens=150)

## add lengths with names
psdCalc(~yepmm,data=yepdf,species="Yellow perch",addLens=150,addNames="minLen")
psdCalc(~yepmm,data=yepdf,species="Yellow perch",addLens=c("minLen"=150))
psdCalc(~yepmm,data=yepdf,species="Yellow perch",addLens=c(150,275),addNames=c("minSlot","maxSlot"))
psdCalc(~yepmm,data=yepdf,species="Yellow perch",addLens=c("minLen"=150,"maxslot"=275))

## add lengths with names, return just those values that use those lengths
psdCalc(~yepmm,data=yepdf,species="Yellow perch",addLens=c("minLen"=150),justAdds=TRUE)
psdCalc(~yepmm,data=yepdf,species="Yellow perch",addLens=c("minLen"=150),justAdds=TRUE,
        what="traditional")
psdCalc(~yepmm,data=yepdf,species="Yellow perch",addLens=c(150,275),
        addNames=c("minSlot","maxSlot"),justAdds=TRUE)
psdCalc(~yepmm,data=yepdf,species="Yellow perch",addLens=c(150,275),
        addNames=c("minSlot","maxSlot"),justAdds=TRUE,what="traditional")

## different output types
psdCalc(~yepmm,data=yepdf,species="Yellow perch",addLens=150,what="traditional")
psdCalc(~yepmm,data=yepdf,species="Yellow perch",addLens=150,what="incremental")
psdCalc(~yepmm,data=yepdf,species="Yellow perch",addLens=150,what="none")

## Show intermediate values
psdCalc(~yepmm,data=yepdf,species="Yellow perch",showInterm=TRUE)
psdCalc(~yepmm,data=yepdf,species="Yellow perch",what="traditional",showInterm=TRUE)
psdCalc(~yepmm,data=yepdf,species="Yellow perch",what="incremental",showInterm=TRUE)

## Control the digits
psdCalc(~yepmm,data=yepdf,species="Yellow perch",digits=1)




