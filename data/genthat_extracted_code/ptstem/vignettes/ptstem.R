## ------------------------------------------------------------------------
library(ptstem)

## ------------------------------------------------------------------------
text <- "Em morfologia linguística e recuperação de informação a stemização (do inglês, stemming) é
o processo de reduzir palavras flexionadas (ou às vezes derivadas) ao seu tronco (stem), base ou
raiz, geralmente uma forma da palavra escrita. O tronco não precisa ser idêntico à raiz morfológica
da palavra; ele geralmente é suficiente que palavras relacionadas sejam mapeadas para o mesmo
tronco, mesmo se este tronco não for ele próprio uma raiz válida. O estudo de algoritmos para
stemização tem sido realizado em ciência da computação desde a década de 60. Vários motores de
buscas tratam palavras com o mesmo tronco como sinônimos como um tipo de expansão de consulta, em
um processo de combinação."

## ------------------------------------------------------------------------
ptstem(text)

## ------------------------------------------------------------------------
text <- c("avião", "aviões", "aviação", "viação", "aves", "balão", "balões")
ptstem(text)

## ------------------------------------------------------------------------
ptstem(text, complete = FALSE)

## ------------------------------------------------------------------------
ptstem(text, algorithm = "hunspell", complete = FALSE)

## ------------------------------------------------------------------------
ptstem("aviões", "hunspell", complete = FALSE)

## ------------------------------------------------------------------------
ptstem(text, algorithm = "porter", complete = FALSE)

## ------------------------------------------------------------------------
ptstem(text, algorithm = "porter")

## ------------------------------------------------------------------------
text <- c("obama", "gostei", "gostou", "gostamos", "é", "e")

## ------------------------------------------------------------------------
ptstem(text, complete = FALSE)

## ------------------------------------------------------------------------
ptstem(text, complete = FALSE, ignore = c("obama"))

## ------------------------------------------------------------------------
ptstem(text, complete = FALSE, n_char = 1)

## ------------------------------------------------------------------------
ptstem(text, complete = FALSE, ignore = c("go."))

## ------------------------------------------------------------------------
performance()

