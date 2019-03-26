library(stripless)


### Name: panel.bars
### Title: strucplot Panel Functions
### Aliases: panel.bars

### ** Examples

# A half fraction of a 2^5 full factorial with pseudo-replicate responses
# at each design point,

# Build the design matrix
x <- c(-1,1)
ff <- expand.grid(x,x,x,x)
ff[[5]] <- do.call(mapply,c(FUN=prod,ff))
ff <- ff[rep(1:16,e=2),] ## replicates each row twice
names(ff) <- LETTERS[1:5]

# Add a column for the response
ff$y <-c(155.5, 154.8, 158.4, 156.2, 154.8, 152.4, 159.7, 155.5, 161.8, 
159.7, 159, 158.4, 159.7, 157.7, 161.8, 158, 155.9, 151.7, 159, 
158, 154.1, 156.9, 158.4, 158.4, 159, 154.8, 158.4, 156.2, 161.1, 
156.9, 162.6, 159)

# Plot using panel.bars
strucplot(~ y|., data = ff, panel = panel.bars)

# It is often useful to plot the bars the other way, too
strucplot(~ y|., data = ff, panel = panel.bars, horizontal = TRUE)




