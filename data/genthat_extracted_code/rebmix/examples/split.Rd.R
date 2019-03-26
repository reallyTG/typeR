library(rebmix)


### Name: split-methods
### Title: Splits Dataset into Train and Test Datasets
### Aliases: split split-methods split,numeric-method split,list-method
### Keywords: classification

### ** Examples

data("iris")

# Split dataset into train (75%) and test (25%) subsets.

set.seed(5)

Iris <- split(p = 0.75, Dataset = iris, class = 5)

Iris

# Generate simulated dataset.

N <- 1000

class <- c(rep("A", 0.4 * N), rep("B", 0.2 * N),
  rep("C", 0.1 * N), rep("D", 0.05 * N), rep("E", 0.25 * N))

type <- c(rep("train", 0.75 * N), rep("test", 0.25 * N))

n <- 30

Dataset <- data.frame(1:n, sample(class, n))

colnames(Dataset) <- c("y", "class")

# Split dataset into train (60%) and test (40%) subsets.

simulated <- split(p = 0.6, Dataset = Dataset, class = 2)

simulated

# Generate simulated dataset.

Dataset <- data.frame(1:n, sample(class, n), sample(type, n))

colnames(Dataset) <- c("y", "class", "type")

# Split dataset into train and test subsets.

simulated <- split(p = list(type = 3, train = "train",
  test = "test"), Dataset = Dataset, class = 2)

simulated



