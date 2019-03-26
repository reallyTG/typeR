library(DLMtool)


### Name: Replace
### Title: Replace an existing Stock, Fleet, Obs, or Imp object
### Aliases: Replace

### ** Examples

# Replace Stock 
OM <- DLMtool::testOM
OM2 <- Replace(OM, Blue_shark)

# Replace Fleet 
OM <- DLMtool::testOM
OM2 <- Replace(OM, Generic_DecE)

# Replace Fleet from another OM 
OM1 <- new("OM", Albacore, Generic_DecE, Perfect_Info, Overages)
OM2 <- new("OM", Blue_shark, Generic_IncE, Generic_Obs, Perfect_Imp)
OM1a <- Replace(OM1, OM2, "Fleet")




