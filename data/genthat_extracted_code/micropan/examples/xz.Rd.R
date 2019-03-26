library(micropan)


### Name: xzcompress
### Title: Compressing and uncompressing text files
### Aliases: xzcompress xzuncompress

### ** Examples

# Creating small file
tf <- tempfile()
cat(file=tf, "Hello world!")

# Compressing
tf.xz <- xzcompress(tf)
print(file.info(tf.xz))

# Uncompressing
tf <- xzuncompress(tf.xz)
print(file.info(tf))
file.remove(tf)




