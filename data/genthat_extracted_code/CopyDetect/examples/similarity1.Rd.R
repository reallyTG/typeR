library(CopyDetect)


### Name: similarity1
### Title: Response Similarity for Dcihotomously Scored Items
### Aliases: similarity1

### ** Examples


data(form1)
dim(form1)
head(form1)

  # the first column of this dataset is unique individual IDs
  # the second column of this dataset is unique center IDs
  # From Column 3 to Column 172, dichotomous item responses


# For the sake of reducing the computational time,
# I will analyze a subset of this dataset (first 20 items)

 subset <- form1[1:1000,1:22]
 
 dim(subset)
 head(subset)


# Computing similarity for a single pair

a <- similarity1(data       = subset, 
                 model      = "1PL", 
                 person.id  = "EID", 
                 item.loc   = 3:22, 
                 single.pair= c("e100287","e100869")) 

print(a)


## No test: 

# Computing for multiple pairs

pairs <- matrix(as.character(sample(subset$EID,20)),nrow=10,ncol=2)

a <- similarity1(data       = subset, 
                 model      = "1PL", 
                 person.id  = "EID", 
                 item.loc   = 3:20, 
                 many.pairs = pairs)

print(a)


# Computing all possible pairs in the requested centers

a <- similarity1(data       = subset, 
                 model      = "1PL", 
                 person.id  = "EID",
                 center.id  = "cent_id",
                 item.loc   = 3:20, 
                 centers    = c(1802,5130,67,9056)) 
                 
print(a)

## End(No test)
	



