library(ncpen)


### Name: interact.data
### Title: Construct Interaction Matrix
### Aliases: interact.data

### ** Examples

df = data.frame(1:3, 4:6, 7:9, 10:12, 13:15);
colnames(df) = c("aa", "bb", "cc", "dd", "aa2");
df

interact.data(df);
interact.data(df, base.cols = "aa");
interact.data(df, base.cols = "aa", exclude.pair = list(c("bb", "cc")));






