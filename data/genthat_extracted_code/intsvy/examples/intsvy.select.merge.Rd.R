library(intsvy)


### Name: intsvy.select.merge
### Title: Select and merge data
### Aliases: intsvy.select.merge

### ** Examples

## Not run: 
##D pirls <- intsvy.select.merge(folder= getwd(),
##D          countries= c("AUS", "AUT", "AZE", "BFR"), 
##D          student= c("ITSEX", "ASDAGE", "ASBGSMR"), 
##D          home= c("ASDHEDUP", "ASDHOCCP", "ASDHELA", "ASBHELA"),
##D          school= c("ACDGDAS", "ACDGCMP", "ACDG03"), 
##D          config = pirls_conf)
##D          
##D pirls <- intsvy.select.merge(folder= getwd(),
##D          countries= c(36, 40, 31, 957),
##D          student= c("ITSEX", "ASDAGE", "ASBGSMR"),
##D          home= c("ASDHEDUP", "ASDHOCCP", "ASDHELA", "ASBHELA"),
##D          school= c("ACDGDAS", "ACDGCMP", "ACDG03"),
##D          config = pirls_conf)
##D                             
##D timss8g <- intsvy.select.merge(folder= getwd(), 
##D            countries=c("AUS", "BHR", "ARM", "CHL"), 
##D            student =c("BSDGEDUP", "ITSEX", "BSDAGE", "BSBGSLM", "BSDGSLM"),
##D            school=c("BCBGDAS", "BCDG03"), config = timss8_conf)
##D            
##D icils <- intsvy.select.merge(folder= getwd(),
##D          countries=c("AUS", "POL", "SVK"),
##D          student =c("S_SEX", "S_TLANG", "S_MISEI"), 
##D          school =c("IP1G02J", "IP1G03A"),
##D          config = icils_conf)
##D          
##D pisa <- pisa.select.merge(folder= getwd(),
##D         school.file="INT_SCQ12_DEC03.sav", 
##D         student.file="INT_STU12_DEC03.sav",
##D         student= c("ST01Q01", "ST04Q01", "ESCS", "PARED"), 
##D         school = c("CLSIZE", "TCSHORT"), 
##D         countries = c("HKG", "USA", "SWE", "POL", "PER"))         
## End(Not run)



