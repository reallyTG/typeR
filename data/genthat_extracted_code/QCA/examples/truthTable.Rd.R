library(QCA)


### Name: truthTable
### Title: Create a truth table
### Aliases: truthTable
### Keywords: functions

### ** Examples

# -----
# Lipset binary crisp data
data(LC)
ttLC <- truthTable(LC, "SURV")

# inspect the truth table
ttLC

# print the cases too, even if not specifically asked for
print(ttLC, show.cases = TRUE)

# the printing function also supports the complete version
print(ttLC, show.cases = TRUE, complete = TRUE)

# formally asking the complete version
truthTable(LC, "SURV", complete = TRUE)

# sorting by multiple columns, decreasing by default
truthTable(LC, "SURV", complete = TRUE, sort.by = "incl, n")

# sort the truth table decreasing for inclusion, and increasing for n
# note that "-" is redundant, sorting is decreasing by default 
truthTable(LC, "SURV", complete = TRUE, sort.by = "incl-, n+")


# -----
# Lipset multi-value crisp data (Cronqvist & Berg-Schlosser 2009, p.80)
data(LM)
truthTable(LM, "SURV", sort.by = "incl")

# using a frequency cutoff equal to 2 cases
ttLM <- truthTable(LM, "SURV", n.cut = 2, sort.by = "incl")
ttLM

# the observed combinations coded as remainders
ttLM$excluded


# -----
# Cebotari & Vink fuzzy data
data(CVF)
ttCVF <- truthTable(CVF, "PROTEST", incl.cut = 0.8, sort.by = "incl")

# view the Venn diagram for this truth table
library(venn)
venn(ttCVF)

# each intersection transparent by its inclusion score
venn(ttCVF, transparency = ttCVF$tt$incl)

# the truth table negating the outcome
truthTable(CVF, "~PROTEST", incl.cut = 0.8, sort.by = "incl")

# allow contradictions
truthTable(CVF, "PROTEST", incl.cut = c(0.8, 0.75), sort.by = "incl")


# -----
# Ragin and Strand data with temporal QCA
data(RS)

# truth table containing the "-" placeholder as a "don't care"
truthTable(RS, "REC")




