library(breathtestcore)


### Name: read_breathid
### Title: Read BreathID file
### Aliases: read_breathid

### ** Examples

filename = btcore_file("350_20043_0_GER.txt")
# Show first lines
cat(readLines(filename, n = 10), sep="\n")
#
bid = read_breathid(filename)
str(bid)



