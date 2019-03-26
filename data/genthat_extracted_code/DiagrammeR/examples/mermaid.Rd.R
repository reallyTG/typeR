library(DiagrammeR)


### Name: mermaid
### Title: R + mermaid.js
### Aliases: mermaid

### ** Examples

## Not run: 
##D # Create a simple graph running left to right (note
##D # that the whitespace is not important)
##D DiagrammeR("
##D   graph LR
##D     A-->B
##D     A-->C
##D     C-->E
##D     B-->D
##D     C-->D
##D     D-->F
##D     E-->F
##D ")
##D # Create the equivalent graph but have it running
##D # from top to bottom
##D DiagrammeR("
##D    graph TB
##D    A-->B
##D    A-->C
##D    C-->E
##D    B-->D
##D    C-->D
##D    D-->F
##D    E-->F
##D ")
##D 
##D # Create a graph with different node shapes and
##D # provide fill styles for each node
##D DiagrammeR("graph LR;A(Rounded)-->B[Squared];B-->C{A Decision};
##D  C-->D[Square One];C-->E[Square Two];
##D  style A fill:#E5E25F;  style B fill:#87AB51; style C fill:#3C8937;
##D  style D fill:#23772C;  style E fill:#B6E6E6;"
##D )
##D 
##D # Load in the 'mtcars' dataset
##D data(mtcars)
##D connections <- sapply(
##D  1:ncol(mtcars)
##D   ,function(i) {
##D      paste0(
##D         i
##D       ,"(",colnames(mtcars)[i],")---"
##D       ,i,"-stats("
##D       ,paste0(
##D         names(summary(mtcars[,i]))
##D         ,": "
##D         ,unname(summary(mtcars[,i]))
##D         ,collapse="<br/>"
##D       )
##D       ,")"
##D    )
##D  }
##D )
##D 
##D # Create a diagram using the 'connections' object
##D DiagrammeR(
##D    paste0(
##D      "graph TD;", "\n",
##D      paste(connections, collapse = "\n"),"\n",
##D      "classDef column fill:#0001CC, stroke:#0D3FF3, stroke-width:1px;" ,"\n",
##D      "class ", paste0(1:length(connections), collapse = ","), " column;"
##D    )
##D  )
##D 
##D # Also with \code{DiagrammeR()}, you can use tags
##D # from \code{htmltools} (just make sure to use
##D # \code{class = "mermaid"})
##D library(htmltools)
##D diagramSpec = "
##D graph LR;
##D   id1(Start)-->id2(Stop);
##D   style id1 fill:#f9f,stroke:#333,stroke-width:4px;
##D   style id2 fill:#ccf,stroke:#f66,stroke-width:2px,stroke-dasharray: 5, 5;
##D "
##D html_print(tagList(
##D   tags$h1("R + mermaid.js = Something Special")
##D   ,tags$pre(diagramSpec)
##D   ,tags$div(class="mermaid",diagramSpec)
##D   ,DiagrammeR()
##D ))
##D 
##D # Create a sequence diagram
##D DiagrammeR("
##D sequenceDiagram;
##D    customer->>ticket seller: ask for a ticket;
##D    ticket seller->>database: seats;
##D    alt tickets available
##D      database->>ticket seller: ok;
##D      ticket seller->>customer: confirm;
##D      customer->>ticket seller: ok;
##D      ticket seller->>database: book a seat;
##D      ticket seller->>printer: print a ticket;
##D    else sold out
##D      database->>ticket seller: none left;
##D      ticket seller->>customer: sorry;
##D    end
##D ")
## End(Not run)



