library(affy)
library(affydata)

data(Dilution)

meth <- bgcorrect.methods()

cat("background correction:\n")

for (m in meth) {
  cat(m,"...")
  abatch.bgc <- bg.correct(Dilution, method=m)
  cat("done.\n")
}
