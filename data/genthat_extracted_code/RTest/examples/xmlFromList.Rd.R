library(RTest)


### Name: xmlFromList
### Title: Creat an XML Node from a list
### Aliases: xmlFromList

### ** Examples


root <- XML::newXMLNode("root")
li <- list(a = list(aa = 1, ab=2), 
			b=list(ba = 1,
                bb=list(x=4,
                       attributes=c(value=3)),
               bb= 2,
              bc =3))
xmlFromList(root,li)

# The result is an XML Node like this
#<root>
#  <a>
#    <aa>1</aa>
#    <ab>2</ab>
#  </a>
#  <b>
#    <ba>1</ba>
#    <bb value="3">
#      <x>4</x>
#    </bb>
#    <bb>2</bb>
#    <bc>3</bc>
#  </b>
#</root> 




