# Build a 4th order MTD model from the pewee data set.
model <- march.mtd.construct(pewee,4)
print(model)

# Build a 3th order MTDg model from the pewee data set.
model <- march.mtd.construct(pewee,3,mtdg=TRUE)
print(model)

