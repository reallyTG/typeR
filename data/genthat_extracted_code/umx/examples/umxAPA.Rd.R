library(umx)


### Name: umxAPA
### Title: Creates nicely formatted journal style summaries of lm models,
###   p-values, data-frames etc.
### Aliases: umxAPA summaryAPA

### ** Examples


# ========================================
# = Report lm (regression/anova) results =
# ========================================
umxAPA(lm(mpg ~ wt + disp, mtcars)) # All parameters
umxAPA(lm(mpg ~ wt + disp, mtcars), "disp") # Just disp effect
umxAPA(lm(mpg ~ wt + disp, mtcars), std = TRUE) # Standardize effects

# glm example
df = mtcars
df$mpg_thresh = 0
df$mpg_thresh[df$mpg>16] = 1
m1 = glm(mpg_thresh ~ wt + gear,data = df, family = binomial)
umxAPA(m1)

# A t-Test
m1 = t.test(1:10, y = c(7:20))
umxAPA(m1)

# ========================================================
# = Summarize a DATA FRAME: Correlations + Means and SDs =
# ========================================================
umxAPA(mtcars[,1:3])
umxAPA(mtcars[,1:3], digits = 3)
umxAPA(mtcars[,1:3], lower = FALSE)
## Not run: 
##D umxAPA(mtcars[,1:3], report = "html")
## End(Not run)

# ===============================================
# = CONFIDENCE INTERVAL text from effect and se =
# ===============================================
umxAPA(.4, .3) # parameter 2 interpreted as SE

# Input beta and CI, and back out the SE
umxAPA(-0.030, c(-0.073, 0.013), digits = 3)

# ====================
# = Format a p-value =
# ====================
umxAPA(.0182613)
umxAPA(.000182613)
umxAPA(.000182613,  addComparison=FALSE)

# ========================
# = report a correlation =
# ========================
data(twinData)
selDVs = c("wt1", "wt2")
mzData <- subset(twinData, zygosity %in% c("MZFF", "MZMM"))
x = cor.test(~ wt1 + wt2, data = mzData)
umxAPA(x)




