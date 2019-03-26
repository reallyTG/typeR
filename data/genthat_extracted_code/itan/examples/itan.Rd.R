library(itan)


### Name: itan
### Title: Análisis y calificación de pruebas objetivas.
### Aliases: itan itan
### Keywords: package

### ** Examples

data(datos)
data(clave)
# Muestra los data frames incorporados en el paquete itan.
head(datos)
clave

# Selecciona las respuestas de los estudiantes a cada ítem.
respuestas <- subset(datos, select = -id )

# Calcula el puntaje y asigna una calificación.
respCorregidas <- corregirItems(respuestas, clave)
puntajes <- calcularPuntajes(respCorregidas)
notas <- calcularNotas(puntajes)
cbind(datos$id,pje=puntajes, nota=notas)

# Muestra información sobre la distribución de las notas.
summary(notas)

# Calcula el índice de dificultad y de discriminación y
# realiza análisis de distractores.
items <- analizarItems(respCorregidas)
distractores <- frecuenciaDistractores(respuestas, clave, frecuencia = FALSE)
data.frame(items, distractores)
analizarDistractores(respuestas, clave)

# Calcula la correlación biserial puntual de los distractores.
pBis(respuestas, clave)

# Realiza el análisis gráfico de ítems.
 plots <- agi(respuestas, clave, ncol(respuestas)/2)
 plots[[1]][[1]]



