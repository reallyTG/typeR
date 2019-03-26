## ----setup, echo = FALSE-------------------------------------------------
knitr::opts_chunk$set(
    collapse=TRUE,
    comment = NA,
    prompt = TRUE
    )
set.seed(42)

## ----installation CRAN, eval=FALSE---------------------------------------
#  install.packages("Rsampling")

## ----installation, eval=FALSE--------------------------------------------
#  library(devtools)
#  install_github(repo = 'lageIBUSP/Rsampling')

## ----load library--------------------------------------------------------
library(Rsampling)

## ----inspecionando objeto embauba----------------------------------------
head(embauba)
summary(embauba)

## ----proporcao de infestacao por morfo de embauba------------------------
tapply(embauba$with.vines, embauba$morphotype, mean)

## ----estatistica de interesse embaubas-----------------------------------
emb.ei <- function(dataframe){
    props <- tapply(dataframe$with.vines, dataframe$morphotype, mean)
    props[[1]] - props[[2]]
}
## Verificando
emb.ei(embauba)

## ----embaubas resampling, results="hide"---------------------------------
emb.r <- Rsampling(type = "normal", dataframe = embauba,
                   statistics = emb.ei, cols = 2, ntrials = 1000)

## ----embaubas distribuicao nula, fig.cap="Distribuição das diferenças nas proporções de embaúbas brancas e vermelhas com lianas em 1000 simulações da hipótese nula de ausência de diferença nas populações amostradas. A linha vermelha indica a diferença observada. A região de aceitação da hipótese nula para 5% de significância está delimitada em cinza."----
dplot(emb.r, svalue = emb.ei(embauba), pside="Greater",
      main = "Distribuição da estatística de interesse sob H0",
      xlab = "Estatística de interesse")

## ----embaubas teste------------------------------------------------------
sum(emb.r >= emb.ei(embauba))/1000 < 0.05

## ----inspecionando objeto azteca-----------------------------------------
head(azteca)
summary(azteca)

## ----pairplot azteca, fig.cap = "Número de formigas recrutadas por extratos de folhas novas e velhas de embaúbas. Os extratos foram aplicados em pares de folhas próximas em embaúbas que tinham colônias de formigas. As linhas ligam folhas do mesmo par experimental."----
splot(azteca$extract.new, azteca$extract.old,
           groups.names=c("Folha nova","Folha velha"),
           ylab="N de formigas recrutadas",
           xlab="Tipo de extrato aplicado")

## ----estatistica de interesse azteca-------------------------------------
azt.ei <- function(dataframe){
    diferencas <- with(dataframe, extract.new - extract.old)
    mean(diferencas)
}
## Valor observado
azt.ei(azteca)

## ----azteca resampling, results="hide"-----------------------------------
azt.r <- Rsampling(type = "within_rows", dataframe = azteca,
                   statistics = azt.ei, cols = 2:3, ntrials = 1000)

## ----azteca distribuicao nula, fig.cap="Distribuição das diferenças do número de formigas recrutadas por extratos de folhas novas e velhas de embaúba em pares experimentais, em 1000 simulações da hipótese nula de ausência de diferença. A linha vermelha indica a diferença observada. A região de aceitação da hipótese nula para 5% de significância está delimitada em cinza."----
dplot(azt.r, svalue = azt.ei(azteca), pside="Greater",
      main = "Distribuição da estatística de interesse sob H0",
      xlab = "Estatística de interesse")

## ----azteca teste--------------------------------------------------------
sum(azt.r >= azt.ei(azteca))/1000 < 0.05

## ----azteca distribuicao nula bicaudal, fig.cap="Distribuição das diferenças do número de formigas recrutadas por extratos de folhas novas e velhas de embaúba em pares experimentais, em 1000 simulações da hipótese nula de ausência de diferença. A região de aceitação da hipótese nula para 5% de significância para teste bicaudal está delimitada em cinza."----
dplot(azt.r, svalue = azt.ei(azteca), pside="Two sided",
      main = "Teste bicaudal",
      xlab = "Estatística de interesse")

## ----inspecionando objeto peucetia---------------------------------------
head(peucetia)

## ----barplot peucetia, fig.cap = "Número de inspeções em que as 27 aranhas foram registradas em folhas com tricomas, em um experimento de preferência por substratos."----
## Número de inspeções em que estava em folha com tricomas
n.insp <- apply(peucetia, 1, sum)
barplot(table(factor(n.insp, levels=0:6)),
        xlab="N de inspeções em que estava na folha com tricoma",
        ylab="N de aranhas")


## ----estatistica de interesse peucetia-----------------------------------
peu.ei <- function(dataframe){
    mean(apply(dataframe, 1, sum))
}
## Valor observado
peu.ei(peucetia)

## ----peucetia H0---------------------------------------------------------
peu.H0 <- matrix( rep(c(TRUE,FALSE), each = 3),
                 nrow = nrow(peucetia), ncol = ncol(peucetia), byrow=TRUE)
## Converte em data.frame
peu.H0 <- data.frame(peu.H0)
## verificando
head(peu.H0)

## ----peucetia resampling, results="hide"---------------------------------
peu.r <- Rsampling(type = "within_rows", dataframe = peu.H0,
                   statistics = peu.ei, ntrials = 1000, replace=TRUE)

## ----peucetia distribuicao nula, fig.cap="Distribuição do número médio de inspeções em que as aranhas estavam em folhas com tricomas, em 1000 simulações da hipótese nula de ausência de preferência por substrato. A linha vermelha indica a média observada. A região de aceitação da hipótese nula para 5% de significância está delimitada em cinza."----
dplot(peu.r, svalue = peu.ei(peucetia), pside="Greater",
      main = "Distribuição da estatística de interesse sob H0",
      xlab = "Estatística de interesse")

## ----peucetia teste------------------------------------------------------
sum(peu.r >= peu.ei(peucetia))/1000 < 0.05

## ----peucetia n de inspeções---------------------------------------------
## N de inspeções em folha com tricoma
tric <- apply(peucetia, 1, sum)
## N de inspeções em folha lisa
lisa <- apply(peucetia, 1, function(x) sum(x==0))
## Monta o data frame
peu.H0b <- data.frame(tric=tric, lisa = lisa)
## Primeiras linhas
head(peu.H0b)

## ----peucetia statistics 2-----------------------------------------------
peu.ei2 <- function(dataframe) mean(dataframe$tric)
## Verificando
peu.ei2(peu.H0b)

## ----peucetia resampling 2, results="hide"-------------------------------
peu.r2 <- Rsampling(type = "within_rows", dataframe = peu.H0b,
                   statistics = peu.ei2, ntrials = 1000)

## ----peucetia distribuicao nula 2, fig.cap="Distribuição do número médio de inspeções em que as aranhas estavam em folhas com tricomas, em 1000 simulações da hipótese nula de ausência de preferência por substrato, considerando tendência das aranhas permanecerem onde estão. A linha vermelha indica a média observada."----
dplot(peu.r2, svalue = peu.ei2(peu.H0b), pside="Greater",
      main = "Distribuição da estatística de interesse sob H0",
      xlab = "Estatística de interesse")

## ----peucetia teste 2----------------------------------------------------
sum(peu.r2 >= peu.ei(peucetia))/1000 < 0.05

## ----pielou inspecionando objeto-----------------------------------------
pielou

## ----pielou indice de brillouin------------------------------------------
brillouin <- function(x, base=10) {
    N <- sum(x)
    lfactorial(N)/(log(base)*N)  -  sum(lfactorial(x)/log(base))/N
}

## ----pielou estatistica brillouin----------------------------------------
pielou.ei <- function(dataframe)
    brillouin( dataframe ) - brillouin( apply(dataframe,2,sum) )

## ----pielou estatistica de interesse-------------------------------------
pielou.ei(pielou)

## ---- results="hide"-----------------------------------------------------
pielou.r1 <- Rsampling(type = "within_rows", dataframe = pielou,
                   statistics = pielou.ei, ntrials = 1000, fix.zeroes = TRUE)

## ----pielou nula 2, fig.cap="Distribuição da sobreposição média de uso de plantas hospedeiras por espécies de pulgões, em 1000 simulações da hipótese nula de independência das espécies de inseto pelas plantas. As plantas sem ocorrência observadas dos pulgões foram consideradas não disponíveis (zeros estruturais). A linha vermelha indica a média observada."----
dplot(pielou.r1, svalue = pielou.ei(pielou), pside="Lesser",
      main = "Distribuição da estatística de interesse sob H0",
      xlab = "Estatística de interesse", xlim=c(0.3,0.6))

## ----teste 2-------------------------------------------------------------
sum(pielou.r1 <= pielou.ei(pielou))/1000 < 0.05

