### R code from vignette source 'ElastH.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: options
###################################################
options(width=70, max.print=50)


###################################################
### code chunk number 2: Instalar (eval = FALSE)
###################################################
## install.packages("ElastH")


###################################################
### code chunk number 3: Instalar (eval = FALSE)
###################################################
## install.packages("Caminho/ElastH_0.3.1.tar.gz", repos=NULL, type="source")


###################################################
### code chunk number 4: carregar
###################################################
library(ElastH)


###################################################
### code chunk number 5: data
###################################################
data(Exemplo)


###################################################
### code chunk number 6: Exemplo.y
###################################################
Exemplo$y
Exemplo$Hpib


###################################################
### code chunk number 7: define.decompor1
###################################################
modelo <- Exemplo$modelo


###################################################
### code chunk number 8: decompor1 (eval = FALSE)
###################################################
## modelo <- decompor(Exemplo$y)


###################################################
### code chunk number 9: classExemplo
###################################################
class(Exemplo$y)


###################################################
### code chunk number 10: modelo1
###################################################
modelo$comp


###################################################
### code chunk number 11: testes
###################################################
modelo$q
modelo$h
modelo$nt


###################################################
### code chunk number 12: define.decompor2
###################################################
modelo <- Exemplo$modelo2


###################################################
### code chunk number 13: decompor2 (eval = FALSE)
###################################################
## modelo <- decompor(Exemplo$y, X=Exemplo$Hpib)


###################################################
### code chunk number 14: decompor2.print
###################################################
modelo$comp


###################################################
### code chunk number 15: definir.criardlm3
###################################################
modelo <- Exemplo$modelo3


###################################################
### code chunk number 16: decompor3.noteval (eval = FALSE)
###################################################
## modelo <- decompor(Exemplo$y, X=Exemplo$Hpib, inclinacao="F")


###################################################
### code chunk number 17: decompor3.print
###################################################
modelo$comp


###################################################
### code chunk number 18: decompor4 (eval = FALSE)
###################################################
## modelo <- decompor(Exemplo$y, X=Exemplo$Hpib, comeco=2007, 
##                     fim=c(2014,4))


###################################################
### code chunk number 19: decompor.todos (eval = FALSE)
###################################################
## lista.dlm <- decompor.todos(Exemplo$y, X=Exemplo$Hpib, 
##                         comeco=2005, fim=c(2014,4))


###################################################
### code chunk number 20: tdlms.str (eval = FALSE)
###################################################
## str(lista.dlm,1)


###################################################
### code chunk number 21: tdlms.str.print
###################################################
str(Exemplo$lista.y,1)


###################################################
### code chunk number 22: tdlms.comp (eval = FALSE)
###################################################
## lista.dlm[[1]]$comp


###################################################
### code chunk number 23: tdlms.comp.print
###################################################
Exemplo$lista.y[[1]]$comp


###################################################
### code chunk number 24: classeigual (eval = FALSE)
###################################################
## class(lista.dlm[[1]]) == class(modelo)


###################################################
### code chunk number 25: classeigual.print
###################################################
class(Exemplo$lista.y[[1]]) == class(modelo)


###################################################
### code chunk number 26: elasticidade (eval = FALSE)
###################################################
## resultado <- calcular.elasticidades(Exemplo$receitas, 
##              Hpib=Exemplo$Hpib, Hpet=Exemplo$Hpet, fim=c(2015,4))


###################################################
### code chunk number 27: exemplo
###################################################
Exemplo$receitas


###################################################
### code chunk number 28: define.resultado
###################################################
resultado <- Exemplo$resultado


###################################################
### code chunk number 29: resultado.print
###################################################
str(resultado,1)


###################################################
### code chunk number 30: resultado.trt4
###################################################
resultado$trt[[4]]$comp


###################################################
### code chunk number 31: resultado.tgc7
###################################################
resultado$tgc[[7]]$comp


###################################################
### code chunk number 32: exportarcao.show (eval = FALSE)
###################################################
## resultado.exportacao <- exportar(resultado)


###################################################
### code chunk number 33: salvando (eval = FALSE)
###################################################
## write.csv2(resultado.exportacao, file="Caminho/Desejado/Nome.csv")


###################################################
### code chunk number 34: Script (eval = FALSE)
###################################################
## arquivo   <- "elasticidades.csv"
## Receitas  <- NULL
## Hpib      <- NULL
## Hpet      <- NULL
## fim       <- c(2016,4)
## tce     <- NULL
## comeco <- list(
##   trt  = 2000,
##   tfp  = 1997,
##   trc  = 1997,
##   ti   = 2001,
##   tm   = 2005,
##   tgc  = 2005,
##   roy  = 2000,
##   pe   = 2000,
##   tran = 2002,
##   icms = 1997,
##   iss  = 2002)
## 
## 
## resultado <- list(
##   trt  = decompor.todos(Receitas[, "TRT"] , X = Hpib,
##                     comeco = comeco$trt , fim = fim),
##   trt1 = decompor.todos(Receitas[, "TRT"] , X = lag(Hpib,-1),
##                     comeco = comeco$trt , fim = fim),
##   trt2 = decompor.todos(Receitas[, "TRT"] , X = cbind(Hpib, lag(Hpib, -1)),
##                     comeco = comeco$trt , fim = fim),
##   
##   tfp  = decompor.todos(Receitas[, "TFP"] , X = Hpib,
##                     comeco = comeco$tfp , fim = fim),
##   tfp1 = decompor.todos(Receitas[, "TFP"] , X = lag(Hpib,-1),
##                     comeco = comeco$tfp , fim = fim),
##   tfp2 = decompor.todos(Receitas[, "TFP"] , X = cbind(Hpib, lag(Hpib, -1)),
##                     comeco = comeco$tfp , fim = fim),
## 
##   trc  = decompor.todos(Receitas[, "TRC"] , X = Hpib,
##                     comeco = comeco$trc , fim = fim),
##   trc1 = decompor.todos(Receitas[, "TRC"] , X = lag(Hpib,-1),
##                     comeco = comeco$trc , fim = fim),
##   trc2 = decompor.todos(Receitas[, "TRC"] , X = cbind(Hpib, lag(Hpib, -1)),
##                     comeco = comeco$trc , fim = fim),
## 
##   ti   = decompor.todos(Receitas[, "TI"]  , X = Hpib,
##                     comeco = comeco$ti  , fim = fim),
##   ti1  = decompor.todos(Receitas[, "TI"]  , X = lag(Hpib,-1),
##                     comeco = comeco$ti  , fim = fim),
##   ti2  = decompor.todos(Receitas[, "TI"]  , X = cbind(Hpib, lag(Hpib, -1)),
##                     comeco = comeco$ti  , fim = fim),
## 
##   tm   = decompor.todos(Receitas[, "TM"]  , X = cbind(Hpib, log(tce)),
##                     comeco = comeco$tm, fim = fim),
##   tm1  = decompor.todos(Receitas[, "TM"]  , X = cbind(lag(Hpib,-1), log(tce)),
##                     comeco = comeco$tm, fim = fim),
##   tm2  = decompor.todos(Receitas[, "TM"], 
##                     X = cbind(Hpib, lag(Hpib, -1), log(tce)),
##                     comeco = comeco$tm, fim = fim),
## 
##   tgc  = decompor.todos(Receitas[, "TGC"] , X = Hpib,
##                     comeco = comeco$tgc , fim = fim),
##   tgc1 = decompor.todos(Receitas[, "TGC"] , X = lag(Hpib, -1),
##                     comeco = comeco$tgc , fim = fim),
##   tgc2 = decompor.todos(Receitas[, "TGC"] , X = cbind(Hpib, lag(Hpib, -1)),
##                     comeco = comeco$tgc , fim = fim),
## 
##   roy  = decompor.todos(Receitas[, "ROY"] , X = Hpet,
##                     comeco = comeco$roy , fim = fim),
##   roy1 = decompor.todos(Receitas[, "ROY"] , X = lag(Hpet, -1),
##                     comeco = comeco$roy , fim = fim),
##   roy2 = decompor.todos(Receitas[, "ROY"] , X = cbind(Hpet, lag(Hpet, -1)),
##                     comeco = comeco$roy , fim = fim),
##   
##   pe   = decompor.todos(Receitas[, "PE"]  , X = Hpet,
##                     comeco = comeco$pe  , fim = fim),
##   pe1  = decompor.todos(Receitas[, "PE"]  , X = lag(Hpet, -1),
##                     comeco = comeco$pe  , fim = fim),
##   pe2  = decompor.todos(Receitas[, "PE"]  , X = cbind(Hpet, lag(Hpet, -1)),
##                     comeco = comeco$pe  , fim = fim),
## 
##   tran = decompor.todos(Receitas[, "TRAN"], X = Hpib,
##                     comeco = comeco$tran, fim = fim),
##   tran1= decompor.todos(Receitas[, "TRAN"], X = lag(Hpib, -1),
##                     comeco = comeco$tran, fim = fim),
##   tran2= decompor.todos(Receitas[, "TRAN"], X = cbind(Hpib, lag(Hpib, -1)),
##                     comeco = comeco$tran, fim = fim),
## 
##   icms = decompor.todos(Receitas[, "ICMS"], X = Hpib,
##                     comeco = comeco$icms, fim = fim),
##   icms1= decompor.todos(Receitas[, "ICMS"], X = lag(Hpib,-1),
##                     comeco = comeco$icms, fim = fim),
##   icms2= decompor.todos(Receitas[, "ICMS"], X = cbind(Hpib, lag(Hpib, -1)),
##                     comeco = comeco$icms, fim = fim),
## 
##   iss  = decompor.todos(Receitas[, "ISS"] , X = Hpib,
##                     comeco = comeco$iss , fim = fim),
##   iss1 = decompor.todos(Receitas[, "ISS"] , X = lag(Hpib, -1),
##                     comeco = comeco$iss , fim = fim),
##   iss2 = decompor.todos(Receitas[, "ISS"] , X = cbind(Hpib, lag(Hpib, -1)),
##                     comeco = comeco$iss , fim = fim)
## )
## 
## ret <- exportar(resultado)
## write.csv2(ret, file=arquivo)


