library(tablaxlsx)


### Name: escribirTabla
### Title: Write a matrix or data.frame with styles in a sheet of a excel
###   workbook
### Aliases: escribirTabla

### ** Examples

## Example 1
matriz=matrix(runif(20),4,5)
wb=createWorkbook()
hoja=addWorksheet(wb,"Prueba")
escribirTabla(matriz,wb,hoja,fila=4,columna=4)
if(interactive()) openXL(wb)

# Example 2
f1=ftable(mtcars[,c(2,8:11)],col.vars=3:4)
wb=escribirTabla(f1,estilos=estilosDGE,bordes=c("TABLA","DATOS"),
                 escudo=system.file("img/logoJMR.png",package="tablaxlsx"))
l1=escribirTabla(f1,wb,"otra",anchoCabecera=20,estilos=estilosDGE,bordes=c("TABLA","DATOS"),
                escudo=system.file("img/logoJMR.png",package="tablaxlsx"),
                posEscudo=c(2,2),tamEscudo=c(1,1))
if(interactive()) openXL(wb)



