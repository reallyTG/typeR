
# Setup some test partitions
p = new("Partition", c(0, 0, 1, 1, 1))
q = new("Partition", c(0, 0, 0, 1, 1))
r = new("Partition", c(0, 0, 1, 0, 0))
s = new("Partition", c(0, 0, 1, 2, 2))

random_partition <- new("Partition", sample(8, 100, replace = TRUE))
