library(HH)


### Name: likertMosaic
### Title: Diverging stacked barcharts for Likert, semantic differential,
###   rating scale data, and population pyramids based on mosaic as the
###   plotting style.
### Aliases: likertMosaic likertMosaic.array likertMosaic.data.frame
###   likertMosaic.default likertMosaic.formula likertMosaic.list
###   likertMosaic.matrix
### Keywords: hplot

### ** Examples

## See file HH/demo/likertMosaic-paper.r for a complete set of examples.
## Not run: 
##D   require(vcd)
##D   data(ProfChal)
##D   likertMosaic(Question ~ . | Subtable, ProfChal,
##D                main="Is your job professionally challenging?")
##D   likertMosaic(Question ~ . | Subtable, ProfChal,
##D                main="Is your job professionally challenging?", as.percent=TRUE)
##D   likertMosaic(Question ~ . | Subtable, ProfChal,
##D                main="Is your job professionally challenging?", as.percent=TRUE,
##D                positive.order=TRUE)
##D   likertMosaic(Question ~ . | Subtable, ProfChal,
##D                main="Is your job professionally challenging?", as.percent=TRUE,
##D                variable.width=TRUE)
##D 
##D   EmpRows <- ProfChal$Subtable == "Employment sector"
##D   ProfChal2 <- ProfChal[EmpRows, 1:5]
##D   rownames(ProfChal2) <- substr(ProfChal[EmpRows, "Question"], 1, 5)
##D 
##D   likertMosaic(ProfChal2)
##D   likertMosaic(ProfChal2, main="Employment")
##D   likertMosaic(ProfChal2, main="Employment", ReferenceZero=0)
##D   likertMosaic(ProfChal2, main="Employment", ReferenceZero=3.5)
##D   likertMosaic(ProfChal2, main="Employment", ReferenceZero=4)
##D   likertMosaic(ProfChal2, main="Employment", ReferenceZero=6)
##D   likertMosaic(ProfChal2, main="Employment", positive.order=TRUE)
##D   likertMosaic(ProfChal2, main="Employment", variable.width=TRUE)
##D 
##D   likertMosaic(~ ., data.frame(ProfChal2), main="Employment", positive.order=TRUE)
##D 
##D   likertMosaic(~ ., data.frame(ProfChal2), main="Employment", variable.width=TRUE)
##D   likert(~ ., data.frame(ProfChal2), main="Employment", variable.width=TRUE)
##D 
##D   data(SFF8121)
##D   likertMosaic(aperm(SFF8121, c(3,1,2)))
##D 
## End(Not run)



