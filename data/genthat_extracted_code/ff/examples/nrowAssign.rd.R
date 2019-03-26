library(ff)


### Name: nrowAssign
### Title: Assigning the number of rows or columns
### Aliases: nrow<- ncol<-
### Keywords: array

### ** Examples

  a <- as.ff(1:26)
  b <- as.ff(factor(letters)) # vmode="integer"
  c <- as.ff(factor(letters), vmode="ubyte")
  df <- ffdf(a,b,c)
  nrow(df) <- 2*26
  df
  message("NOTE that the new rows have silently the first level 'a' for UNSIGNED vmodes")
  message("NOTE that the new rows have an illegal factor level <0> for SIGNED vmodes")
  message("It is your responsibility to put meaningful content here")
  message("As an example we replace the illegal zeros by NA")
  df$b[27:52] <- NA
  df

  rm(a,b,c,df); gc()



