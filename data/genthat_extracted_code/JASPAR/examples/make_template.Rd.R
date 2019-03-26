library(JASPAR)


### Name: make_template
### Title: Make a template that feeds into JASPAR databases
### Aliases: make_template

### ** Examples

x <-
  rbind(
        c(3, 0, 0, 0, 0, 0),
        c(8, 0, 23, 0, 0, 0),
        c(2, 23, 0, 23, 0, 24),
        c(11, 1, 1, 1, 24, 0)
        )

PARAM <-
  list(
       INT_ID=NULL,
       BASE_ID="MA0006",
       COLLECTION="CORE",
       VERSION=1,
       NAME="Arnt-Ahr",
       SPECIES="10090")
TAG <-
  list(
       class="bHLH",
       medline="7592839",
       tax_group="vertebrate",
       sysgroup="vertebrate",
       acc="P30561",
       acc="P53762",
       comment="dimer",
       type="SELEX",
       newest=1
       )
cat(make_template(x=x,PARAM=PARAM,TAG=TAG))



