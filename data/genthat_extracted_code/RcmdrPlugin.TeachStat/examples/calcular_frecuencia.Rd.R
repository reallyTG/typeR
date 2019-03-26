library(RcmdrPlugin.TeachStat)


### Name: calcular_frecuencia
### Title: Frequency distributions for qualitative variables
### Aliases: calcular_frecuencia tabla.frec.cualitativa

### ** Examples

data(cars93)
aa <- calcular_frecuencia(df.nominal=cars93["Type"], ordenado.frec=TRUE, df.ordinal=NULL, 
                          cuantil.p=0.5, iprint = TRUE)
calcular_frecuencia(df.nominal=NULL, ordenado.frec=TRUE, df.ordinal=cars93["Airbags"], 
                    cuantil.p=0.25, iprint = TRUE)
bb <- calcular_frecuencia(df.nominal=cars93["Type"], ordenado.frec=TRUE, 
                          df.ordinal=cars93["Airbags"], cuantil.p=0.25, iprint = FALSE)
str(bb)
bb



