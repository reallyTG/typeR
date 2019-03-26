library(AMR)


### Name: EUCAST_rules
### Title: EUCAST expert rules
### Aliases: EUCAST_rules interpretive_reading
### Keywords: eucast interpretive reading resistance

### ** Examples

a <- EUCAST_rules(septic_patients)
a <- data.frame(mo = c("STAAUR",  # Staphylococcus aureus
                       "ENCFAE",  # Enterococcus faecalis
                       "ESCCOL",  # Escherichia coli
                       "KLEPNE",  # Klebsiella pneumoniae
                       "PSEAER"), # Pseudomonas aeruginosa
                vanc = "-",       # Vancomycin
                amox = "-",       # Amoxicillin
                coli = "-",       # Colistin
                cfta = "-",       # Ceftazidime
                cfur = "-",       # Cefuroxime
                stringsAsFactors = FALSE)
a

b <- EUCAST_rules(a)
b



