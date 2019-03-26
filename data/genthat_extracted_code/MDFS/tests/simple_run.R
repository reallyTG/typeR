library(MDFS)

result <- MDFS(madelon$data, madelon$decision, dimensions=1, divisions=1, discretizations=1, range=0, seed=0)

print(result)
