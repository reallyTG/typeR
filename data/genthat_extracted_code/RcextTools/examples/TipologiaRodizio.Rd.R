library(RcextTools)


### Name: TipologiaRodizio
### Title: Identifica potenciais mercados de risco de praticas colusivas a
###   partir de grafo de licitacoes
### Aliases: TipologiaRodizio

### ** Examples

## Not run: 
##D 
##D  # carrega dados de licitacoes da base fornecida pelo pacote RcextTools
##D  data("part_lic")
##D 
##D  dtDados <- part_lic[!is.na(part_lic$COD_LICITACAO),]
##D 
##D  dtDados <- data.frame(
##D    CNPJ = dtDados$CNPJCPF_FORNECEDORES,
##D    ID_LICITACAO = dtDados$COD_LICITACAO,
##D    ID_ITEM = dtDados$ID_ITEM,
##D    VENCEDOR = ifelse(dtDados$VENCEDOR == 'S', T, F),
##D    VALOR_ESTIMADO = NA,
##D    VALOR_HOMOLOGADO = as.numeric(dtDados$VALOR_FINAL),
##D    DESC_OBJETO = dtDados$RESUMO_OBJETO,
##D    stringsAsFactors = F
##D  )
##D 
##D  casosSuspeitos <- TipologiaRodizio(dtDados)
##D 
##D  # imprime dataframe com resultados
##D  print(casosSuspeitos)
##D 
##D  # plota grafo
##D  plot(casosSuspeitos)
## End(Not run)



