library(gtools)


### Name: smartbind
### Title: Efficient rbind of data frames, even if the column names don't
###   match
### Aliases: smartbind
### Keywords: manip

### ** Examples


  df1 <- data.frame(A=1:10, B=LETTERS[1:10], C=rnorm(10) )
  df2 <- data.frame(A=11:20, D=rnorm(10), E=letters[1:10] )

  # rbind would fail
## Not run: 
##D   rbind(df1, df2)
##D   # Error in match.names(clabs, names(xi)) : names do not match previous
##D   # names:
##D   #	D, E
## End(Not run)
  # but smartbind combines them, appropriately creating NA entries
  smartbind(df1, df2)

  # specify fill=0 to put 0 into the missing row entries
  smartbind(df1, df2, fill=0)

## Don't show: 
  n=10 # number of data frames to create
  s=10 # number of rows in each data frame

  # create a bunch of column names
  names <- LETTERS[2:5]

  # create a list 'Z' containing 'n' data frames, each with 3 columns
  # and 's' rows.  The first column is always named 'A', but the other
  # two have a names randomly selected from 'names'

  Z <- list()
  for(i in 1:n)
    {
      X <- data.frame(A=sample(letters,s,replace=TRUE),
                      B=letters[1:s],
                      C=rnorm(s) )
      colnames(X) <- c("A",sample(names,2,replace=FALSE))
      Z[[i]] <- X
    }

  # Error in match.names(clabs, names(xi)) : names do not match
  # previous names: E

  # But smartbind will 'do the right thing'
  df <- do.call("smartbind",Z)
  df

  # Equivalent call:
  df <- smartbind(list=Z)

## End(Don't show)



