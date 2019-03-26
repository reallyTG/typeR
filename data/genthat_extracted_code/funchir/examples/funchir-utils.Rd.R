library(funchir)


### Name: funchir-utils
### Title: Miscellaneous utile functions
### Aliases: create_quantiles to.pct nx.mlt dol.form ntostr write.packages
###   clean_slate embed.mat get_age quick_year quick_wday quick_mday D

### ** Examples

  x <- runif(100)

  # Return which multiple of 1/7 least
  #   exceeds each element of x
  create_quantiles(x, 7)

  to.pct(x)
  to.pct(x, dig = 2) #output of the form xxx.xx

  nx.mlt(x, 1/3)

  dol.form(x, dig=2L)
  
  ntostr(999:1000, dig = 3L) # c("999","000")
  ntostr(999:1000, dig = 2L) # c("99","00")
  
  library(stats)
  write.packages(file.path(tempdir(), "test.txt"))
  
  inmat <- matrix(1:9, ncol = 3L)
  embed.mat(inmat, M = 4L, N = 4L)
  embed.mat(inmat, N = 6L, n = 4L, fill = NA)
  
  D("01-01-2016", format = "%m-%d-%Y")
  D("2004-03-02")
  D(1L, 2L, origin = D("1980-01-01"))
  
  get_age(D("1987-05-02"), D("2016-02-23"))
  quick_year(D("1987-05-02"))
  quick_wday(D("1987-05-02"))
  quick_mday(D("1987-05-02"))



