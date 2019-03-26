library(CopyDetect)


### Name: similarity2
### Title: Response Similarity Indices for Nominal Response Items
### Aliases: similarity2

### ** Examples


data(form2)
dim(form2)
head(form2)

  # the first column of this dataset is unique individual IDs
  # the second column of this dataset is unique center IDs
  # From Column 3 to Column 172, nominal item responses. 1, 2, 3, and 4 represent different 
  # nominal response options.


# For the sake of reducing the computational time,
# I will analyze a subset of this dataset (first 10 items)

 subset <- form2[1:500,1:12]
 
 dim(subset)
 head(subset)

                        
# Computing similarity for a single pair

  key.resp <- c(2,3,1,4,1,2,2,1,1,1)

  a <- similarity2(data         = subset,
                   resp.options = c(1,2,3,4),
                   key          = key.resp, 
                   person.id    = "EID", 
                   item.loc     = 3:12, 
                   single.pair  = c("e200287","e200169"))
                   
  print(a)


## No test: 

  # Computing for multiple pairs

  pairs <- matrix(as.character(sample(subset$EID,20)),nrow=10,ncol=2)

  a <- similarity2(data         = subset,
                   resp.options = c(1,2,3,4),
                   key          = key.resp, 
                   person.id    = "EID", 
                   item.loc     = 3:12, 
                   many.pairs   = pairs)

  print(a)


# Computing all possible pairs in the requested centers

  a <- similarity2(data         = subset,
                   resp.options = c(1,2,3,4),
                   key          = key.resp, 
                   person.id    = "EID", 
                   center.id    = "cent_id",
                   item.loc     = 3:12, 
                   centers      = c(42,45,4114))

  print(a)
  
  
  # Key response vector for all 170 items for future reference

  key.resp <- c(2,3,1,4,1,2,2,1,1,1,4,1,3,1,3,3,1,2,1,3,3,4,1,
                3,3,2,3,2,2,3,1,4,1,2,3,3,2,3,4,1,2,1,1,4,3,3,
                1,1,4,2,2,1,4,1,2,3,3,1,2,4,1,4,2,4,1,1,2,3,4,
                4,1,4,2,1,2,2,2,2,4,4,3,2,1,3,2,3,2,2,1,2,4,3,
                2,1,2,1,2,3,1,1,4,3,4,3,4,3,1,3,3,4,2,1,1,4,3,
                2,4,4,1,1,1,2,2,1,3,1,2,3,3,3,4,4,1,4,4,3,4,2,
                3,1,4,1,4,1,3,2,2,4,4,4,1,2,2,3,4,1,2,1,4,4,4,
                1,3,1,2,1,2,3,2,2)
## End(No test)
		



