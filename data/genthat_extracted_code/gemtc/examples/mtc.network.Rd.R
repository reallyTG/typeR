library(gemtc)


### Name: mtc.network
### Title: Create an mtc.network
### Aliases: mtc.network plot.mtc.network

### ** Examples

# Create a new network by specifying all information.
treatments <- read.table(textConnection('
  id  description
  A   "Treatment A"
  B   "Treatment B"
  C   "Treatment C"'), header=TRUE)
data <- read.table(textConnection('
  study  treatment  responders  sampleSize
  01     A          2           100
  01     B          5           100
  02     B          6           110
  02     C          1           110
  03     A          3           60
  03     C          4           80
  03     B          7           80'), header=TRUE)
network <- mtc.network(data, description="Example", treatments=treatments)
plot(network)

# Create a new network by specifying only the data.
data <- read.table(textConnection('
  study  treatment  mean   std.dev  sampleSize
  01     A          -1.12  0.6      15
  01     B          -1.55  0.5      16
  02     A          -0.8   0.7      33
  02     B          -1.1   0.5      31'), header=TRUE)
network <- mtc.network(data)

# Print the network
print(network)
## MTC dataset: Network
##   study treatment  mean std.dev sampleSize
## 1     1         A -1.12     0.6         15
## 2     1         B -1.55     0.5         16
## 3     2         A -0.80     0.7         33
## 4     2         B -1.10     0.5         31



