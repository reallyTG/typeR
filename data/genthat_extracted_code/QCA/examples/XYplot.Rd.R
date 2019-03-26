library(QCA)


### Name: XYplot
### Title: Create an XY plot
### Aliases: XYplot
### Keywords: functions

### ** Examples


# Cebotari & Vink (2013)
data(CVF)

# necessity relation between NATPRIDE and PROTEST
XYplot(CVF[, 5:6])

# same using two numeric vectors
XYplot(CVF$NATPRIDE, CVF$PROTEST)

# same using two column names
XYplot("NATPRIDE", "PROTEST", data = CVF)

# or using one string containing both
XYplot("NATPRIDE, PROTEST", data = CVF)

# since they are valid R statements, it works even without quotes
# (this only works in normal R console, not in the GUI version)
XYplot(NATPRIDE, PROTEST, data = CVF)

# negating the X axis, using numeric vectors
XYplot(1 - CVF$NATPRIDE, CVF$PROTEST)

# same thing using quotes
XYplot("1 - NATPRIDE, PROTEST", data = CVF)

# using tilde for negation
XYplot("~NATPRIDE, PROTEST", data = CVF)

# different color for the points
XYplot("~NATPRIDE, PROTEST", data = CVF, col = "blue")

# using a different character expansion for the axes
XYplot("~NATPRIDE, PROTEST" , data = CVF, cex.axis = 0.9)

# custom axis labels
XYplot("~NATPRIDE, PROTEST", data = CVF, xlab = "Negation of NATPRIDE",
       ylab = "Outcome: PROTEST")

# necessity relation
XYplot("~NATPRIDE, PROTEST", data = CVF, relation = "necessity")

# jitter the points
XYplot("~NATPRIDE, PROTEST", data = CVF, jitter = TRUE)

# jitter with more amount
XYplot("~NATPRIDE, PROTEST", data = CVF, jitter = TRUE, amount = 0.02)

# adding labels to points
XYplot("~NATPRIDE, PROTEST", data = CVF, jitter = TRUE, cex = 0.8,
       clabels = rownames(CVF))

# or just the row numbers, since the row names are too long
XYplot("~NATPRIDE, PROTEST", data = CVF, jitter = TRUE, cex = 0.8,
       clabels = seq(nrow(CVF)))


# using a SOP expression (necessity relation)
XYplot("NATPRIDE <= ~PROTEST", data = CVF, jitter = TRUE, cex = 0.8,
       clabels = seq(nrow(CVF)))


#-----
# enhanced XY plot for process tracing
XYplot("~NATPRIDE, PROTEST", data = CVF, enhance = TRUE, jitter = TRUE)


# enhanced XY plot for a solution model
sol <- "natpride + DEMOC*GEOCON*POLDIS + DEMOC*ETHFRACT*GEOCON"
XYplot("~NATPRIDE, PROTEST", data = CVF, enhance = TRUE, model = TRUE)


# same plot, automatically detected from object pCVF
ttCVF <- truthTable(CVF, "PROTEST", incl.cut = 0.85)
pCVF <- minimize(ttCVF, include = "?")
XYplot(pCVF$solution[1], "PROTEST", data = CVF, enhance = TRUE)




