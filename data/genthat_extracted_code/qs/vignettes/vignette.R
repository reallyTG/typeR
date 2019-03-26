## ----eval=FALSE----------------------------------------------------------
#  library(qs)
#  df1 <- data.frame(x=rnorm(5e6), y=sample(5e6), z=sample(letters,5e6))
#  qsave(df1, "myfile.q")
#  df2 <- qread("myfile.q")

## ----eval=FALSE----------------------------------------------------------
#  install.packages("qs") ## CRAN version
#  remotes::install_github("traversc/qs", configure.args="--with-simd=AVX2") ## Latest version

## ----eval=FALSE----------------------------------------------------------
#  remotes::install_github("traversc/qs", ref = "qs34")

## ----eval=FALSE----------------------------------------------------------
#  data.frame(a=rnorm(5e6), b=rpois(100,5e6),
#             c=sample(starnames[["IAU Name"]],5e6,T),
#             stringsAsFactors = F)

## ----eval=FALSE----------------------------------------------------------
#  # With byte shuffling
#  x <- 1:1e8
#  qsave(x, "mydat.q", preset="custom", shuffle_control=15, algorithm="zstd")
#  cat( "Compression Ratio: ", as.numeric(object.size(x)) / file.info("mydat.q")$size, "\n" )
#  # Compression Ratio:  1389.164
#  
#  # Without byte shuffling
#  x <- 1:1e8
#  qsave(x, "mydat.q", preset="custom", shuffle_control=0, algorithm="zstd")
#  cat( "Compression Ratio: ", as.numeric(object.size(x)) / file.info("mydat.q")$size, "\n" )
#  # Compression Ratio:  1.479294

## ----eval=FALSE----------------------------------------------------------
#  df1 <- data.frame(x = randomStrings(1e6), y = randomStrings(1e6), stringsAsFactors = F)
#  qsave(df1, "temp.q")
#  rm(df1); gc() ## remove df1 and call gc for proper benchmarking
#  
#  # With alt-rep
#  system.time(qread("temp.q", use_alt_rep=T))[1]
#  #     0.109 seconds
#  
#  
#  # Without alt-rep
#  gc(verbose=F)
#  system.time(qread("temp.q", use_alt_rep=F))[1]
#  #     1.703 seconds

