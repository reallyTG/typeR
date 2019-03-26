## ----setup, include = FALSE----------------------------------------------
library(hR)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----hierarchyLong-------------------------------------------------------
ee = c("Dale@hR.com","Bob@hR.com","Julie@hR.com","Andrea@hR.com")
supv = c("Julie@hR.com","Julie@hR.com","Andrea@hR.com","Susan@hR.com")
df = hierarchyLong(ee,supv)
print(df)

# How many employees report up through Susan?
nrow(df[df$Supervisor=="Susan@hR.com",])

# Who reports up through Susan?
df[df$Supervisor=="Susan@hR.com",]

## ----hierarchyWide-------------------------------------------------------
df = hierarchyWide(ee,supv)
print(df)

# How many employees report up through Susan?
sum(df$Supv1=="Susan@hR.com",na.rm=T)

# Who reports up through Susan?
df[which(df$Supv1=="Susan@hR.com"),]

