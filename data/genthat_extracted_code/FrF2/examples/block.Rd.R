library(FrF2)


### Name: block
### Title: Statistical and algorithmic aspects of blocking in FrF2
### Aliases: block
### Keywords: array design

### ** Examples

########## automatic blocked designs ###################
## from a full factorial ##
FrF2(8,3,blocks=2)
## with replication
run.order(FrF2(8,3,blocks=2,wbreps=2))
run.order(FrF2(8,3,blocks=2,wbreps=2,repeat.only=TRUE))
run.order(FrF2(8,3,blocks=2,bbreps=2))
run.order(FrF2(8,3,blocks=2,bbreps=2,wbreps=2))

## automatic blocked design with fractions
FrF2(16,7,blocks=4,alias.block.2fis=TRUE)
## isomorphic non-catalogued design as basis
FrF2(16,gen=c(7,11,14),blocks=4,alias.block.2fis=TRUE)
## FrF2 uses blockpick.big and ignores the generator
FrF2(64,gen=c(7,11,14),blocks=16,alias.block.2fis=TRUE)

########## manual blocked design ####################
### example that shows why order of blocks is not randomized
### can of course be randomized by user, if appropriate
FrF2(32,9,blocks=c("Day","Shift"),alias.block.2fis=TRUE, 
    factor.names=list(Day=c("Wednesday","Thursday"), Shift=c("Morning","Afternoon"),
        F1="",F2="",F3="",F4="",F5="",F6="",F7=""), default.levels=c("current","new"))




