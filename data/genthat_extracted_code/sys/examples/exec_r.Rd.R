library(sys)


### Name: exec_r
### Title: Execute R from R
### Aliases: exec_r r_wait r_internal r_background

### ** Examples

# Hello world
r_wait("--version")

# Run some code
r_wait(c('--vanilla', '-q', '-e', 'sessionInfo()'))

# Run a script via stdin
tmp <- tempfile()
writeLines(c("x <- rnorm(100)", "mean(x)"), con = tmp)
r_wait(std_in = tmp)



