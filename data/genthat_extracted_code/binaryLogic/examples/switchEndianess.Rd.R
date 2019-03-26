library(binaryLogic)


### Name: switchEndianess
### Title: Switch Endianess.
### Aliases: switchEndianess

### ** Examples

x <- as.binary(c(1,1,0,0), logic=TRUE); print(x); summary(x);
y <- switchEndianess(x); print(y); summary(y);
y <- switchEndianess(x, stickyBits=TRUE); print(y); summary(y);



