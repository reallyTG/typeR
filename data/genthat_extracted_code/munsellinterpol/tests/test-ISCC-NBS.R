
library( munsellinterpol )

#
#   checkColorLookup()
#   performs lookup with ColorBlockFromMunsell() and verifies that the color block number is correct
#
#   return value:  TRUE or FALSE
#
testColorBlock <- function()
    {
    Number  = ColorBlockFromMunsell( CentroidsISCCNBS$MunsellSpec )$Number
    
    #   Number[1] = 57L  test the test !
    
    #   compute the number of classification errors
    idx = which( Number != CentroidsISCCNBS$Number )
    
    out = (length(idx) == 0)
    
    if( ! out )
        {
        mess    = sprintf( "testColorBlock().  There are %d errors\n", length(idx) )
        cat(mess)
        df  = cbind( CentroidsISCCNBS[ idx, ], NumberLookup=Number[idx] )
        print( df )
        }

    return( out )
    }
    
    
if( ! testColorBlock() )    stop( "testColorBlock() failed !\n" )


cat(  "Passed all ISCC-NBS tests !\n" )
