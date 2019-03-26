library(qdap)


### Name: word_associate
### Title: Find Associated Words
### Aliases: word_associate

### ** Examples

## Not run: 
##D ms <- c(" I ", "you")
##D et <- c(" it", " tell", "tru")
##D out1 <- word_associate(DATA2$state, DATA2$person, match.string = ms, 
##D     wordcloud = TRUE,  proportional = TRUE, 
##D     network.plot = TRUE,  nw.label.proportional = TRUE, extra.terms = et,  
##D     cloud.legend =c("A", "B", "C"),
##D     title.color = "blue", cloud.colors = c("red", "purple", "gray70"))
##D 
##D #======================================
##D #Note: You don't have to name the vectors in the lists but I do for clarity
##D ms <- list(
##D     list1 = c(" I ", " you", "not"), 
##D     list2 = c(" wh")          
##D )
##D 
##D et <- list(
##D     B = c(" the", "do", "tru"), 
##D     C = c(" it", " already", "we")
##D )
##D 
##D out2 <- word_associate(DATA2$state, DATA2$person, match.string = ms, 
##D     wordcloud = TRUE,  proportional = TRUE, 
##D     network.plot = TRUE,  nw.label.proportional = TRUE, extra.terms = et,  
##D     cloud.legend =c("A", "B", "C", "D"),
##D     title.color = "blue", cloud.colors = c("red", "blue", "purple", "gray70"))
##D 
##D out3 <- word_associate(DATA2$state, list(DATA2$day, DATA2$person), match.string = ms)
##D 
##D #======================================
##D m <- list(
##D     A1 = c("you", "in"), #list 1
##D     A2 = c(" wh")        #list 2
##D )
##D 
##D n <- list(
##D     B = c(" the", " on"), 
##D     C = c(" it", " no")
##D )
##D 
##D out4 <- word_associate(DATA2$state, list(DATA2$day, DATA2$person), 
##D     match.string = m)
##D out5 <- word_associate(raj.act.1$dialogue, list(raj.act.1$person), 
##D     match.string = m)
##D out6 <- with(mraja1spl, word_associate(dialogue, list(fam.aff, sex), 
##D      match.string = m))
##D names(out6)
##D lapply(out6$dialogue, htruncdf, n = 20, w = 20)
##D 
##D #======================================
##D DATA2$state2 <- space_fill(DATA2$state, c("is fun", "too fun"))
##D 
##D ms <- list(
##D     list1 = c(" I ", " you", "is fun", "too fun"), 
##D     list2 = c(" wh")      
##D )
##D 
##D et <- list(
##D     B = c(" the", " on"), 
##D     C = c(" it", " no")
##D )
##D 
##D out7 <- word_associate(DATA2$state2, DATA2$person, match.string = ms, 
##D     wordcloud = TRUE,  proportional = TRUE, 
##D     network.plot = TRUE,  nw.label.proportional = TRUE, extra.terms = et,  
##D     cloud.legend =c("A", "B", "C", "D"),
##D     title.color = "blue", cloud.colors = c("red", "blue", "purple", "gray70"))
##D     
##D DATA2 <- qdap::DATA2
## End(Not run)



