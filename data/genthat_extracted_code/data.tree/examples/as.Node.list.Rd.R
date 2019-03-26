library(data.tree)


### Name: as.Node.list
### Title: Convert a nested 'list' structure to a 'data.tree' structure
### Aliases: as.Node.list FromListExplicit FromListSimple

### ** Examples

kingJosephs <- list(name = "Joseph I",
                    spouse = "Mary",
                    born = "1818-02-23",
                    died = "1839-08-29",
                    children = list(
                                    list(name = "Joseph II",
                                         spouse = "Kathryn",
                                         born = "1839-03-28",
                                         died = "1865-12-19"),
                                    list(name = "Helen",
                                         born = "1840-17-08",
                                         died = "1845-01-01")
                                    )
                   )
FromListExplicit(kingJosephs)

kingJosephs <- list(head = "Joseph I",
                    spouse = "Mary",
                    born = "1818-02-23",
                    died = "1839-08-29",
                    list(head = "Joseph II",
                         spouse = "Kathryn",
                         born = "1839-03-28",
                         died = "1865-12-19"),
                    list(head = "Helen",
                         born = "1840-17-08",
                         died = "1845-01-01")       
                   )
FromListSimple(kingJosephs, nameName = "head")

kingJosephs <- list(spouse = "Mary",
                    born = "1818-02-23",
                    died = "1839-08-29",
                    `Joseph II` = list(spouse = "Kathryn",
                                       born = "1839-03-28",
                                       died = "1865-12-19"),
                    Helen = list(born = "1840-17-08",
                                 died = "1845-01-01")
                                 
                   )
FromListSimple(kingJosephs, nodeName = "Joseph I")
  



