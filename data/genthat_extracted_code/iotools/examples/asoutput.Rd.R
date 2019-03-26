library(iotools)


### Name: as.output
### Title: Character Output
### Aliases: as.output as.output.default as.output.data.frame
###   as.output.list as.output.matrix as.output.table
### Keywords: manip

### ** Examples

  m = matrix(sample(letters), ncol=2)
  as.output(m)

  df = data.frame(a = sample(letters), b = runif(26), c = sample(state.abb,26))
  as.output(df)



