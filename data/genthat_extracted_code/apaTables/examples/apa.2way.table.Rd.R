library(apaTables)


### Name: apa.2way.table
### Title: Creates a table of means and standard deviations for a 2-way
###   ANOVA design in APA style
### Aliases: apa.2way.table

### ** Examples

# Example 2: 2-way from Fidler & Thompson (2001)
apa.2way.table(iv1=a,iv2=b,dv=dv,data=fidler_thompson,landscape=TRUE, filename="ex2_desc_table.doc")

# Example 3: 2-way from Field et al. (2012) Discovery Statistics Using R
apa.2way.table(iv1=gender,iv2=alcohol,dv=attractiveness,data=goggles,filename="ex3_desc_table.doc")



