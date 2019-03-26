library(R.utils)


### Name: hsize
### Title: Convert byte sizes into human-readable byte sizes
### Aliases: hsize hsize.numeric hsize.object_size
### Keywords: programming internal

### ** Examples

sizes <- c(1000^(0:8), 1024^(0:8))
df <- data.frame(size=sizes)
df$SI <- hsize(sizes, standard="SI")
df$TB <- hsize(sizes, units="TB")
df$IEC <- hsize(sizes, standard="IEC")
df$TiB <- hsize(sizes, units="TiB")
print(df)



