library(tab)


### Name: tabfreq
### Title: Generate Frequency Tables for Statistical Reports
### Aliases: tabfreq
### Keywords: table frequency crosstab

### ** Examples

# Load in sample dataset d and drop rows with missing values
data(d)
d <- d[complete.cases(d), ]

# Compare sex distribution by group, with group as column variable
freqtable1 <- tabfreq(x = d$Group, y = d$Sex)

# Same comparison, but compress table to show Female row only, show percent (SE) rather
# than n (percent), and suppress (n = ) from column headings
freqtable2 <- tabfreq(x = d$Group, y = d$Sex, compress = TRUE, compress.val = "Female",
                      cell = "col.percent", parenth = "se", n.headings = FALSE)

# Compare sex distribution by race, suppressing (n = ) from column headings and 
# showing percent (95% CI) rather than n (percent)
freqtable3 <- tabfreq(x = d$Race, y = d$Sex, n.headings = FALSE, cell = "col.percent")

# Use rbind to create single table comparing sex and race in control vs. treatment group
freqtable4 <- rbind(tabfreq(x = d$Group, y = d$Sex), tabfreq(x = d$Group, y = d$Race))
                            
# A (usually) faster way to make the above table is to call the the tabmulti function
freqtable5 <- tabmulti(dataset = d, xvarname = "Group", yvarnames = c("Sex", "Race"))
                        
# freqtable4 and freqtable5 are equivalent
all(freqtable4 == freqtable5)

# Click on freqtable1, ... , freqtable5 in the Workspace tab of RStudio to see the tables 
# that could be copied and pasted into a report. Alternatively, setting the latex input to 
# TRUE produces tables that can be inserted into LaTeX using the xtable package.



