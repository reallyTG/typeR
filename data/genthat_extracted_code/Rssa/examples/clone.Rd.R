library(Rssa)


### Name: clone
### Title: Cloning of SSA objects
### Aliases: clone clone.ssa

### ** Examples

# Decompose 'co2' series with default parameters
s <- ssa(co2);
# Perform 'normal copy' of SSA object
s1 <- s;
# Perform 'deep copy' of SSA object
s2 <- clone(s);
# Add some data to 's'
reconstruct(s);
# Now 's1' also contains this data, but 's2' - not
summary(s1);
summary(s2);



