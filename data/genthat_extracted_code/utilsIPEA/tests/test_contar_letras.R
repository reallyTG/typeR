test_that("contar_letras", {
  nomes <- c("Pedro dos Anjos", "Maria das Gracas")
  re <- data.table(a=c(1,5),
                   b=c(0,0),
                   c=c(0,1),
                   d=c(2,1),
                   e=c(1,0),
                   f=c(0,0),
                   g=c(0,1),
                   h=c(0,0),
                   i=c(0,1),
                   j=c(1,0),
                   k=c(0,0),
                   l=c(0,0),
                   m=c(0,1),
                   n=c(1,0),
                   o=c(3,0),
                   p=c(1,0),
                   q=c(0,0),
                   r=c(1,2),
                   s=c(2,2),
                   t=c(0,0),
                   u=c(0,0),
                   v=c(0,0),
                   w=c(0,0),
                   x=c(0,0),
                   y=c(0,0),
                   z=c(0,0))
  setnames(re, names(re),paste(names(re), "nome", sep = "_") )
  base <- data.table(nome = nomes)
  rbase <- contar_letras(base, "nome")
  expect_equal(rbase, re)
})

# test_that("contar_letras with suffix", {
#   nomes <- c("Pedro dos Anjos", "Maria das Graças")
#   re <- data.table(a=c(1,5),
#                    b=c(0,0),
#                    c=c(0,1),
#                    d=c(2,1),
#                    e=c(1,0),
#                    f=c(0,0),
#                    g=c(0,1),
#                    h=c(0,0),
#                    i=c(0,1),
#                    j=c(1,0),
#                    k=c(0,0),
#                    l=c(0,0),
#                    m=c(0,1),
#                    n=c(1,0),
#                    o=c(3,0),
#                    p=c(1,0),
#                    q=c(0,0),
#                    r=c(1,2),
#                    s=c(2,2),
#                    t=c(0,0),
#                    u=c(0,0),
#                    v=c(0,0),
#                    w=c(0,0),
#                    x=c(0,0),
#                    y=c(0,0),
#                    z=c(0,0))
#   setnames(re, names(re),paste(names(re), "teste", sep = "_") )
#   base <- data.table(nome = nomes)
#   rbase <- contar_letras(base, "nome", suffix = "teste")
#   expect_equal(rbase, re)
# })

test_that("contar_letras stop", {
  nomes <- c("Pedro dos Anjos", "Maria das Gracas")
  base <- data.table(nome = nomes)
  expect_error(contar_letras(base, 1, suffix = "teste"))
})
