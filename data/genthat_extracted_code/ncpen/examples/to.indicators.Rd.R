library(ncpen)


### Name: to.indicators
### Title: Construct Indicator Matrix
### Aliases: to.indicators

### ** Examples

a1 = 4:10;
b1 = c("aa", "bb", "cc");

to.indicators(a1, base = 10);
to.indicators(b1, base = "bb", prefix = "T_");
to.indicators(as.data.frame(b1), base = "bb");






