library(conting)


### Name: add_term
### Title: Determines Model Moves Given Current Model
### Aliases: add_term drop_term prop_mod

### ** Examples


data(AOH)
## Load the AOH data

maximal.mod<-glm(formula=y~(alc+hyp+obe)^3,data=AOH,x=TRUE,y=TRUE,
contrasts=list(alc="contr.sum",hyp="contr.sum",obe="contr.sum"))
## Set up the maximal model which in this case is the saturated model.

curr.index<-formula2index(big.X=maximal.mod$x,formula=y~alc+hyp+obe+hyp:obe,data=AOH)
## Set up the binary vector for the model containing all main effects and the 
## hyp:obe interaction.

add_term(curr.index=curr.index,data=AOH,maximal.mod=maximal.mod)
## See what terms we can add - will get: 

#[1] "alc:hyp" "alc:obe"

drop_term(curr.index=curr.index,data=AOH,maximal.mod=maximal.mod)
## See what terms we can drop - will get: 

#[1] "hyp:obe"

set.seed(4)
## Set the seed for reproducibility.

prop_mod(curr.index=curr.index,data=AOH,maximal.mod=maximal.mod)
## Propose a model. Will be a drop move, proposing the independence model by 
## dropping the hyp:obe interaction. The total.choices object is 3, i.e. one 
## drop move and two add moves. Specifically:

#$new.index
# [1] 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#
#$type
#[1] "drop"
#
#$total.choices
#[1] 3
#
#$null.move.prob
#[1] 0.5




