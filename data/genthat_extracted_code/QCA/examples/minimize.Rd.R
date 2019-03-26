library(QCA)


### Name: minimize
### Title: Minimize a truth table
### Aliases: minimize eqmcc
### Keywords: functions

### ** Examples


    
# -----
# Lipset binary crisp data
data(LC)

# the associated truth table
ttLC <- truthTable(LC, "SURV", sort.by = "incl, n", show.cases = TRUE)
ttLC

# conservative solution (Rihoux & De Meur 2009, p.57)
cLC <- minimize(ttLC)
cLC

# view the Venn diagram for the associated truth table
library(venn)
venn(cLC)

# add details and case names
minimize(ttLC, details = TRUE)

# negating the outcome
ttLCn <- truthTable(LC, "~SURV", sort.by = "incl, n", show.cases = TRUE)
minimize(ttLCn)

# using a tilde instead of upper/lower case names
minimize(ttLCn, use.tilde = TRUE)

# parsimonious solution, positive output
pLC <- minimize(ttLC, include = "?", details = TRUE)
pLC

# the associated simplifying assumptions
pLC$SA

# parsimonious solution, negative output
pLCn <- minimize(ttLCn, include = "?", details = TRUE)
pLCn


# -----
# Lipset multi-value crisp data (Cronqvist & Berg-Schlosser 2009, p.80)
data(LM)

# truth table 
ttLM <- truthTable(LM, "SURV", conditions = "DEV, URB, LIT, IND",
        sort.by = "incl", show.cases = TRUE)

# conservative solution, positive output
minimize(ttLM, details = TRUE)

# parsimonious solution, positive output
minimize(ttLM, include = "?", details = TRUE)

# negate the outcome
ttLMn <- truthTable(LM, "~SURV", conditions = "DEV, URB, LIT, IND",
         sort.by = "incl", show.cases = TRUE)

# conservative solution, negative output
minimize(ttLMn, details = TRUE)

# parsimonious solution, positive output
minimize(ttLMn, include = "?", details = TRUE)

# -----
# Lipset fuzzy sets data (Ragin 2009, p.112)
data(LF)
# truth table using a very low inclusion cutoff
ttLF <- truthTable(LF, "SURV", incl.cut = 0.7,
        sort.by = "incl", show.cases = TRUE)

# conservative solution
minimize(ttLF, details = TRUE)

# parsimonious solution
minimize(ttLF, include = "?", details = TRUE)

# intermediate solution using directional expectations
iLF <- minimize(ttLF, include = "?", details = TRUE,
                dir.exp = "1,1,1,1,1")
iLF



# -----
# Cebotari & Vink (2013, 2015)
data(CVF) 

ttCVF <- truthTable(CVF, outcome = "PROTEST", incl.cut = 0.8,
                    sort.by = "incl, n", show.cases = TRUE)

pCVF <- minimize(ttCVF, include = "?", details = TRUE)
pCVF

# inspect the PI chart
pCVF$PIchart

# DEMOC*ETHFRACT*poldis is dominated by DEMOC*ETHFRACT*GEOCON
# using row dominance to solve the PI chart
pCVFrd <- minimize(ttCVF, include = "?", row.dom = TRUE, details = TRUE)

# plot the prime implicants on the outcome
pims <- pCVFrd$pims

par(mfrow = c(2, 2))
for(i in 1:4) {
    XYplot(pims[, i], CVF$PROTEST, cex.axis = 0.6)
}



# -----
# temporal QCA (Ragin & Strand 2008) serving the input as a dataset,
# which will automatically be passed to truthTable() as an intermediary
# step before the minimization

data(RS)
minimize(RS, outcome = "REC", details = TRUE)




