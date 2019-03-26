library(ggsolvencyii)


### Name: geom_sii_riskoutline
### Title: geom_sii_riskoutline
### Aliases: geom_sii_riskoutline

### ** Examples

library(ggsolvencyii)
library(ggplot2)

## see details about id and comparewithid
# sii_z_ex3_data[sii_z_ex3_data$description == "SCR", ]

ggplot()+
geom_sii_riskoutline(data = sii_z_ex3_data, mapping = aes(
  # comparewithid = comparewithid,
  x = time,
  y = ratio,
  value = value,
  id = id,
  description = description),
color = "red",
lwd = 0.7
)

##and with comparewithid in  aes()

ggplot()+
geom_sii_riskoutline(data = sii_z_ex3_data, mapping = aes(
  comparewithid = comparewithid,
  x = time,
  y = ratio,
  value = value,
  id = id,
  description = description),
color = "red",
lwd = 0.7
)





