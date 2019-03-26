library(ggsolvencyii)


### Name: geom_sii_riskconnection
### Title: geom_sii_riskconnection
### Aliases: geom_sii_riskconnection

### ** Examples

library(ggsolvencyii)
library(ggplot2)

sii_z_ex3_data[sii_z_ex3_data$description == "SCR", ]

ggplot() + geom_sii_riskconnection(data = sii_z_ex3_data, mapping = aes(
  comparewithid = comparewithid,
  x = time,
  y = ratio,
  id = id,
  ),
color = "red",
lwd = 0.7,
arrow = arrow()
)



