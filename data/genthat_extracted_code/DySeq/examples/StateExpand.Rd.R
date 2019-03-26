library(DySeq)


### Name: StateExpand
### Title: StateExpand
### Aliases: StateExpand

### ** Examples

 # Example 1
 data(CouplesCope) # Load sample data
 CouplesCope[1:5,] # inspect first five cases

 my.expand<-StateExpand(CouplesCope, 2:49, 50:97)
 my.expand[1:5,] # inspect first five cases of the combined sequences



 # Example 2: with NA replacement
 data(CouplesCope)
 
 # copy part of the example data
 # excluding code and EDCm for simplification
 na.CouplesCope<-CouplesCope[,2:97] 
 
   
 # fill it with 10% NA's as an example:
 na.CouplesCope[matrix(sample(c(TRUE, rep(FALSE,9)),64*96, TRUE), 64, 96)]<-NA 
 na.CouplesCope[1:5,] # inspect the first 5 cases
 
 # demonstrate na.replace: combine states and fill NA's with zeros!
 my.expand<-StateExpand(na.CouplesCope, 1:48, 49:96, replace.na=0) 
 my.expand[1:5,] # inspect the first 5 cases



## Not run: 
##D  # Example 3: Use StateExpand for further analyis 
##D  #            or plotting using the Package TraMineR
##D               
##D  # install.packages("TraMineR") # install "TraMineR" for graphical analysis
##D  library(TraMineR) #load TraMineR
##D 
##D  my.expand<-StateExpand(CouplesCope, 2:49, 50:97) # create combined sequences
##D 
##D  # create labels for plot
##D  couple.labels <-c("no reaction", "stress only", "coping only", "both reactions")  
##D  
##D  # create a sequence object (the way TraMineR represents sequences)
##D  couple.seq <- seqdef(my.expand, labels = couple.labels) 
##D  seqdplot(couple.seq)
##D 
##D  detach(TraMineR) # unloading TraMineR
## End(Not run)



