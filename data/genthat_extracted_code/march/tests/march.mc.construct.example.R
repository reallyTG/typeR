# pewee dataset is a data object of the march package in march.Dataset class format.
model <- march.mc.construct(pewee,2)

# print the reduced form of the transition matrix of the Markovian Model.
print(model@RC)
