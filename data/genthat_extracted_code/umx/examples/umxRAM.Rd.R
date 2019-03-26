library(umx)


### Name: umxRAM
### Title: Easier path-based SEM modeling.
### Aliases: umxRAM

### ** Examples


# ===========================
# = Here's a simple example =
# ===========================
m1 = umxRAM("tim", data = mtcars,
	umxPath(c("wt", "disp"), to = "mpg"),
	umxPath("wt", with = "disp"),
	umxPath(v.m. = c("wt", "disp", "mpg"))
)
plot(m1, std=TRUE, means=FALSE)

# ====================================
# = A cov model, with steps laid out =
# ====================================

# 1. For convenience, list up the manifests you will be using
selVars = c("mpg", "wt", "disp")

# 2. Create an mxData object
myCov = mxData(cov(mtcars[,selVars]), type = "cov", numObs = nrow(mtcars) )

# 3. Create the model (see ?umxPath for more nifty options)
m1 = umxRAM("tim", data = myCov,
	umxPath(c("wt", "disp"), to = "mpg"),
	umxPath("wt", with = "disp"),
	umxPath(var = selVars)
)

# 4. Use umxSummary to get standardized parameters, CIs etc.
umxSummary(m1, show = "std")

# 5. Display path diagram
plot(m1)
plot(m1, std = TRUE, resid = "line")

# 5. Run an all-continuous WLS model
# TODO: WLS model example
# mw = umxRAM("raw", data = mtcars[, selVars], type = "WLS",
# 	umxPath(c("wt", "disp"), to = "mpg"),
# 	umxPath("wt", with = "disp"),
#  umxPath(var = selVars)
# )

# ===============================
# = Using umxRAM in Sketch mode =
# ===============================
# No data needed: just list variable names!
# Resulting model will be plotted automatically
m1 = umxRAM("what does unique pairs do, I wonder", data = c("B", "C"),
# B<->B, C<->C, B<->C
umxPath(unique.pairs = c("B", "C"))
)

m1 = umxRAM("ring around the rosey", data = c("B", "C"),
# A->B, A->C, B->A, B->C, C->A, C->B
umxPath(fromEach = c("A", "B", "C"))
)

m1 = umxRAM("fromEach with to", data = c("B", "C"),
# B->D, C->D
umxPath(fromEach = c("B", "C"), to= "D")
)

m1 = umxRAM("CFA_play", data = paste0("x", 1:4),
	umxPath("g", to = paste0("x", 1:4)),
	umxPath(var = paste0("x", 1:4)),
	umxPath(v1m0 = "g")
)

# =================================================
# = This is an example of using your own labels:  =
#   umxRAM will not over-ride them                =
# =================================================
m1 = umxRAM("tim", data = myCov,
	umxPath(c("wt", "disp"), to = "mpg"),
	umxPath(cov = c("wt", "disp"), labels = "b1"),
	umxPath(var = c("wt", "disp", "mpg"))
)
omxCheckEquals(m1$S$labels["disp", "wt"], "b1") # label preserved
m1$S$labels
#      mpg             wt            disp
# mpg  "mpg_with_mpg"  "mpg_with_wt" "disp_with_mpg"
# wt   "mpg_with_wt"   "wt_with_wt"  "b1"
# disp "disp_with_mpg" "b1"          "disp_with_disp"



