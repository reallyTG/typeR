## ---- eval=TRUE, warning=FALSE, message=FALSE----------------------------
# Load scoper
library("scoper")

## ---- eval=FALSE, warning=FALSE, message=FALSE---------------------------
#  defineClonesScoper(db, junction = "JUNCTION", v_call = "V_CALL", j_call = "J_CALL",
#                     first = FALSE, cdr3 = FALSE, mod3 = FALSE, iter_max = 1000,
#                     nstart = 25, nproc = 1, progress = FALSE, out_name = NULL,
#                     out_dir = ".")

## ---- eval=TRUE, warning=FALSE, message=FALSE----------------------------
# Clone data using defineClonesScoper function
db <- defineClonesScoper(ExampleDb, junction = "JUNCTION", v_call = "V_CALL",
                         j_call = "J_CALL", first = TRUE)

## ---- eval=FALSE, warning=FALSE, message=FALSE---------------------------
#  analyzeClones(db, junction = "JUNCTION", v_call = "V_CALL", j_call = "J_CALL",
#                clone = "CLONE", first = FALSE, cdr3 = FALSE, nproc = 1,
#                progress = FALSE), warning=FALSE, message=FALSE

## ---- eval=TRUE, warning=FALSE, message=FALSE----------------------------
# Clonal assignment analysis
results <- analyzeClones(ClonedExampleDb, junction = "JUNCTION", v_call = "V_CALL",
                         j_call = "J_CALL", clone = "CLONE", first = TRUE)
# print threshold (a numeric)
results@threshold
# get inter and intra conal distances (a data.frame)
df <- results@inter_intra[[1]]
# density plot of inter versus intra clonal distances  (a ggplot).
results@plot_inter_intra
# get the neighborhoods used in spectral clustering (a numeric vector).
ngs <- results@neighborhoods
# plot histogram of neighborhoods (a ggplot).
results@plot_neighborhoods

